//Konrad Sitek
import java.util.concurrent.Semaphore;


public class SeaportManagerImpl implements SeaportManager
{

    Seaway seaway;
    Docks docks;

    public static class Seaway
    {
        private Semaphore sem;
        private Semaphore freedSem;

        Seaway(int size)
        {
            sem = new Semaphore(size,true);
            freedSem = new Semaphore(1);
        }

        public void unlockPlace() {freedSem.release();}

        public void lockPlace() {freedSem.acquireUninterruptibly();}

        public void unlockSeaway() {sem.release();}

        public void lockSeaway() {sem.acquireUninterruptibly();}

    }

    public static class Docks
    {
        private Ship[] arr;
        private Semaphore semArr;
        Docks(int size)
        {
            semArr = new Semaphore(1);
            arr = new Ship[size];
        }

        public void lock()
        {
            semArr.acquireUninterruptibly();
        }

        public void unlock()
        {
            semArr.release();
        }

        public boolean addToDock(Ship s)
        {
            lock();

            int j = 0 , start = 0;
            for(int i =  0 ; i < arr.length ; i++)
            {
                if(arr[i] != null)
                {
                    j = 0;
                    start = i + 1;
                }
                else j++;


                if(j == s.getDockingSize())
                {
                    for(int x = start ; x < start + s.getDockingSize(); x++) arr[x] = s;
                    unlock();
                    return true;
                }
            }

            unlock();
            return false;
        }

        public int portEntrance(Ship s)
        {
            lock();

            int i = 0;
            while(i < arr.length)
                if(arr[i] == s) break;
                else i++;

            unlock();
            return i;

        }

        public void exit(Ship s)
        {
            lock();
            int start = s.getAssignedDock();
            int end = s.getAssignedDock() + s.getDockingSize();
            for(int i = start ; i < end ; i++) arr[i] = null;
            unlock();
        }

    }

    public void init(int numberOfDocks, int seawayCapacity) {

        seaway = new Seaway(seawayCapacity);
        docks = new Docks(numberOfDocks);
    }


    public void requestSeawayEntrance(Ship s) {

        seaway.lockPlace();
        seaway.lockSeaway();

        while(!docks.addToDock(s));

        seaway.unlockPlace();
    }


    public int requestPortEntrance(Ship s) {

        return docks.portEntrance(s);
    }


    public void signalPortEntered(Ship s) {
        seaway.unlockSeaway();
    }

    public void requestPortExit(Ship s) {
        seaway.lockSeaway();
    }

    public void signalPortExited(Ship s) {
        docks.exit(s);
    }

    public void signalShipSailedAway(Ship s) {
       seaway.unlockSeaway();

    }
}

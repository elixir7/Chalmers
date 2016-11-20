public class List implements ListInterface
{
	 // maximum list size
	 protected final int CAPACITY = 10_000;
	 // array storing list elements
	 protected Character[] elements;
	 // number of elements in the list
	 protected int size;

	// create an empty list
	 public List() {
         elements = new Character[CAPACITY];
		 size = 0;
    }
	 
    public int size() {
        return size;
    }
	 

    public Character get(int index) {
        // if `index' is a valid position in the list
        if (0 <= index && index < size)
            // element at position `index'
            return elements[index];
        else
            return null;
    }

	 // is the list full to capacity?
	 public boolean full() {
         return size >= CAPACITY;
	 }
   
	 public void add(int index, Character e) {
         // if the list is not full and `index' is a valid insertion position
		 if (!full() && 0 <= index && index <= size) {
             // make room at position `index'
             // by shifting elements to the right
             for (int k = size; index < k; k--)
                 elements[k] = elements[k - 1];
             // add `e' at (freed) position `index'
             elements[index] = e;
             // update size
             size = size + 1;
		  }
		  // else: do nothing
	 }
	 
	 public void remove(int index) {
         // if `index' is a valid position in the list
		  if (0 <= index && index < size) {
              // overwrite at position `index'
              // by shifting elements to the left
              for (int k = index; k < size - 1; k++)
                  elements[k] = elements[k + 1];
              // update size
              size = size - 1;
		  }
		  // else: do nothing
	 }

     // toString is defined in Object
     // and provides a String representation for printing
	 @Override
	 public String toString() {
		  StringBuilder result = new StringBuilder(size*100);
		  for (int k = 0; k < size; k++) {
				result.append(get(k).toString());
				if (k < size - 1)
					 result.append(", ");
		  }
		  return "[" + result.toString() + "]";
	 }
}

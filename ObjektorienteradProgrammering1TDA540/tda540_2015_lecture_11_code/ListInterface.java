public interface ListInterface
{
    // number of elements in the list
    public int size();

    // element at position `index'
    // null if `index' is not a valid position in the list
    public Character get(int index);

    // add element `e' at position `index'
    // do nothing if `index' is not a valid insertion position
    public void add(int index, Character e);

    // remove element at position `index'
    // do nothing if `index' is not a valid position in the list
    public void remove(int index);
}

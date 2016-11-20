class Client
{
	static void testList() {
		// create empty list
		List list = new List();
		System.out.println(list); // list: []
		// insert in invalid position
		list.add(2, 'X');
		System.out.println(list); // list: []
		// insert in valid position
		list.add(0, 'X');
		System.out.println(list); // list: [X]
		list.add(1, 'Y');
		System.out.println(list); // list: [X, Y]
		list.add(2, 'Z');
		System.out.println(list); // list: [X, Y, Z]
		// remove
		list.remove(1);
		System.out.println(list); // list: [X, Z]
		// insert back
		list.add(1, 'A');
		System.out.println(list); // list: [X, A, Z]
	}

	 public static void main(String[] args) {
		  testList();
	 }
}

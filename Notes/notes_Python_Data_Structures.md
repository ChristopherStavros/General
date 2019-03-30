# What is a Data Structure

Is it a way to store data

- List
- Set
- Dictionary
- Linked List
- Queue
- Stack
- etc.

# The Linked List

- A linked list is a sequence of items
- Each item only knows where the next item is
- List elements are called Nodes

## Example - A Students linked list

### The Node class

Node | 
--- |
name |
matric_number |
year_study |
**Node** next |

### Linked list objects

#### First node is called the "Head" or the "Root"

<table>
<tr valign="top">
<td>

Node |
--- |
"George" |
"1575465G" |
2 |
**Node** next |
</td>

<td>
&rarr;  
</td>
<td>

Node |
--- |
"Anna" |
"3324515P" |
3 |
**Node** next |

<td>
&rarr; 
</td>

<td> 
  
Node |
--- |
"Phillip" |
"7785657L" |
3 |
**Node** next |

</td>
<td>
&rarr; 
</td>

<td>  
  
None |
--- |
</td>  
</table>

## Implementing the Linked List

- We need to create two classes
  - Node (holds the data **and the next node**)
  - LinkedList (manages the Nodes, and **holds the first Node**)

### The LinkedList class
 - This has methods to:
   - Find a node in the LinkedList, for which we need to supply the student name
   - Add to add a new node t the beginning of the linked list
    
### List and Node

<table>
<tr valign="top"><td>

LinkedList |
--- |
**Node** head   (Initially this is **None**) |  
addToList(Node) |
find(String) |

</td>
<td>

Node | 
--- |
name |
matric_number |
year_study |
**Node** next |

</td>
</tr> 
</table>

### addToList()

- This method is going to take a Node as parameter
- If the head is None -- our LinkedList is empty -- , we will make the head of the LinkedList equal to the new Node
 - If the LinkedList is not empty, we will put this new Node at the beginning, by making the new Node the head of the LinkedList, and making it point to the next Node in the LinkedList

    ```python
    def add_to_list(self, node):
        if self.__root:
            node.set_next(self.__root)
        self.__root = node
    ```

![alt text](/Images/data_structures/List_and_Node1 "List and Node")

 ### find(String)

 - This method is going to go through all the items in our LinkedList (iterate over our LinkedList)

 - If any Node has the same student name as the one we are looking for, we tell the user the matriculation number and study year of the student

    ```python
    def find(self, name):
        marker = self.__root
        while marker:
            if marker.name == name:
                return marker
            else:
                marker = marker.get_next()
        raise LookupError("Name {} was not found in the linked list.".format(name))
    ```

# The Queue

## What can a queue do?

- push() - Add a new element (Node) at the end
- pop() - Remove an element (Node) from the beginning
- size() - Find its size
- print() - Print itself

## Creating a waiting list queue

- It will hold the name and telephone number of each person in the waiting list
- We can add or remove people from it

## How to implement a queue

- Using the LiskedList we created previously
- Each node holds the data (name and telephone number), instead of student data &rarr; this means we have to modify the node class

### How do we add an element to the end?

- Instead of adding to the end and moving at the beginning we can do this:
  - Add at the beginning
  - Remove at the end

### What can a queue do? v2

- push() - our LinkedList's add_to_list() method
- pop() - remove an element (Node) from the beginning  
- size() - Find its size  
- print() - Print itself  

## pop() - remote at the end

- We go to the second last Node
- We make the Node to which this Node is pointing equal to None
- Python then does the worl to actually delete the last Node from memory

![alt text](/Images/data_structures/Queue1.PNG "Queue1")

![alt text](/Images/data_structures/Queue2.PNG "Queue2")

![alt text](/Images/data_structures/Queue3.PNG "Queue3")

## size()

- To find the size, we go through all the Nodes in the LinkedList
- We create a variable that will store the number of Nodes
- Each time we visit a new Node, we increase that variable by 1

## print()

- Just like the size() method
- We visit all the Nodes, but instead of increasing a variable, we print the Node's details out

# The Stack

- It is similar to a queue
- Instead of First-in-First-Out (FIFO) it's Last-In-First-Out (LIFO)

## What does a stack do?

- Add elements at the beginning
- Remove elements from the beginning
- Find its size
- Print itself

## The end or the beginning?

- Remember, instead of adding and removing from the beginning
  - We can add and remove from the end
  - As long as both operations happen on the same end, it will end up being the same

![alt text](/Images/data_structures/Stack1_.PNG "Stack1")

![alt text](/Images/data_structures/Stack2.PNG "Stack2")

## Adding Nodes

- Make the new Node point to the current head
- Make the head of the stack be the new Node
- Just like the linkedLIst class we created, where the add_to_list() method would add new Nodes at the beginning

## Removing Nodes

- Make the head of the stack the second NOde in the Stack
- This way we are skipping the first Node
- And it gets erased from the computer's memory by Python

## The rest

- Same as with the Queue

# Binary Trees

## What is a binary tree?

- It is unlike any data strucure that we have seen
- Unlike a sequence of items or a group of items, this is a branching structure, just like a tree

## Binary tree Nodes

- A Node "points" to two Nodes, its right child and its left child
- Nodes are ordered with a key you select
- The right child will have a greater key than the parent
- The left child will have a smaller key than the parent

![alt text](/Images/data_structures/btree1.png "Binary Tree 1")

![alt text](/Images/data_structures/btree2.png "Binary Tree 2")

![alt text](/Images/data_structures/btree3.png "Binary Tree 3")

![alt text](/Images/data_structures/btree4.png "Binary Tree 4")

![alt text](/Images/data_structures/btree5.png "Binary Tree 5")

![alt text](/Images/data_structures/btree6.png "Binary Tree 6")

![alt text](/Images/data_structures/btree7.png "Binary Tree 7")

![alt text](/Images/data_structures/btree8.png "Binary Tree 8")

![alt text](/Images/data_structures/btree9.png "Binary Tree 9")

# Adding a new Node

- We have a Node we are trying to add
- If its key is greater than the current Node, we move down the right, making the current Node equal to its right child
- If its key is smaller than the current Node, we make the current Node equal to its left child
- If the key is the same, we stop, because we don't want duplicates
- If the current Node is null, we make it equal to the Node we are trying to add

# Finding

- Finding a Node is similar to adding a Node
- If the key of the Node we are looking for is greater than the current Node, we go the the right
- If the current key of the Node we are looking for is smaller than the current Node, we go to the left
- If the current Node is null, we haven't found it
- If the current Node's key is equal to the key of the Node we were looking for, we have found Node!




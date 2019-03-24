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







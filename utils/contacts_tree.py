TAB = '\t'


class Tree:
    def __init__(self, root):
        """
        :param root: the root node, instance of Node class
        """
        self.root = root

    def plot_nodes(self, node, i):
        if len(node.children) == 0:
            print TAB * i + '--' + node.char + '_' + str(node.count)
        else:
            for child in node.children:
                if node.char:
                    print TAB * i + '--' + node.char + '_' + str(node.count)
                self.plot_nodes(child, i + 1)

    def plot_tree(self):
        print '--root'
        self.plot_nodes(self.root, 0)


class Node:
    def __init__(self, char_=None):
        self.char = char_
        self.children = []
        self.count = 0


def test_tree_example():
    tree = Tree(Node())
    root = tree.root
    child_a = Node('a')
    child_b = Node('b')
    child_c = Node('c')
    child_aa = Node('a')
    root.children.append(child_a)
    root.children.append(child_b)
    root.children.append(child_c)
    child_b.children.append(child_aa)
    tree.plot_tree()


def create_new_node(parent_node, char_):
    new_node_ = Node(char_)
    parent_node.children.append(new_node_)
    new_node_.count += 1
    return new_node_


def main():
    tree = Tree(Node())
    n = int(raw_input().strip())
    for a0 in xrange(n):
        op, contact = raw_input().strip().split(' ')
        # Adding word to dictionary tree
        if op == 'add' and len(contact) > 0 :
            node = tree.root
            for char in contact:
                not_appeared_yet = True
                for child in node.children:
                    if char == child.char:
                        not_appeared_yet = False
                        child.count += 1
                        node = child
                        break
                if not_appeared_yet:
                    new_node = create_new_node(parent_node=node, char_=char)
                    node = new_node
        if op == 'find':
            node = tree.root
            count = 0
            for char in contact:
                is_found = False
                for child in node.children:
                    if char == child.char:
                        count = child.count
                        node = child
                        is_found = True
                        break
                    # we didn't break at this point, the char was not found
                if not is_found:
                    count = 0
                    break
            print count


if __name__ == '__main__':
    main()



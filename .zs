{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "17b8583f",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Path found: ['A', 'F', 'G', 'I', 'J']\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "['A', 'F', 'G', 'I', 'J']"
      ]
     },
     "execution_count": 1,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "\n",
    "    \n",
    "def aStarAlgo(start_node, stop_node):\n",
    "    open_set = set(start_node)\n",
    "    closed_set = set()\n",
    "    g = {}\n",
    "    parents = {}\n",
    "    g[start_node] = 0\n",
    "    parents[start_node] = start_node\n",
    "\n",
    "    while len(open_set) > 0:\n",
    "        n = None\n",
    "\n",
    "        for v in open_set:\n",
    "            if n is None or g[v] + heuristic(v) < g[n] + heuristic(n):\n",
    "                n = v\n",
    "\n",
    "        if n == stop_node or Graph_nodes[n] is None:\n",
    "            pass\n",
    "        else:\n",
    "            for (m, weight) in get_neighbors(n):\n",
    "                if m not in open_set and m not in closed_set:\n",
    "                    open_set.add(m)\n",
    "                    parents[m] = n\n",
    "                    g[m] = g[n] + weight\n",
    "                else:\n",
    "                    if g[m] > g[n] + weight:\n",
    "                        g[m] = g[n] + weight\n",
    "                        parents[m] = n\n",
    "\n",
    "                        if m in closed_set:\n",
    "                            closed_set.remove(m)\n",
    "                            open_set.add(m)\n",
    "\n",
    "        if n is None:\n",
    "            print('Path does not exist!')\n",
    "            return None\n",
    "\n",
    "        if n == stop_node:\n",
    "            path = []\n",
    "\n",
    "            while parents[n] != n:\n",
    "                path.append(n)\n",
    "                n = parents[n]\n",
    "\n",
    "            path.append(start_node)\n",
    "            path.reverse()\n",
    "\n",
    "            print('Path found: {}'.format(path))\n",
    "            return path\n",
    "\n",
    "        open_set.remove(n)\n",
    "        closed_set.add(n)\n",
    "\n",
    "    print('Path does not exist!')\n",
    "    return None\n",
    "\n",
    "def get_neighbors(v):\n",
    "    if v in Graph_nodes:\n",
    "        return Graph_nodes[v]\n",
    "    else:\n",
    "        return None\n",
    "\n",
    "def heuristic(n):\n",
    "    H_dist = {\n",
    "        'A': 10, 'B': 8, 'C': 5, 'D': 7, 'E': 3, 'F': 6, 'G': 5, 'H': 3, 'I': 1, 'J': 0\n",
    "    }\n",
    "\n",
    "    return H_dist[n]\n",
    "\n",
    "Graph_nodes = {\n",
    "    'A': [('B', 6), ('F', 3)],\n",
    "    'B': [('C', 3), ('D', 2)],\n",
    "    'C': [('D', 1), ('E', 5)],\n",
    "    'D': [('C', 1), ('E', 8)],\n",
    "    'E': [('I', 5), ('J', 5)],\n",
    "    'F': [('G', 1), ('H', 7)],\n",
    "    'G': [('I', 3)],\n",
    "    'H': [('I', 2)],\n",
    "    'I': [('E', 5), ('J', 3)],\n",
    "}\n",
    "\n",
    "aStarAlgo('A', 'J')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "aeb0e249",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.9.13"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

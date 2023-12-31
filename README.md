# Agent Based Fire Evacuation Model
This project is a simulation of fire evacuation with people and cars involved. We build our model with several steps to ultimately simulate the motion of people and cars in a synthetic road block. In our simulations, the fire comes from the left, and all the agents are supposed to evacuate at the right end of the two roads.

![](https://github.com/ZT220501/Agent-Based-Fire-Evacuation/blob/main/Results/simulation_homogeneous.gif)

The simulation above is the simulation of the homogeneous model without house. Although the parameters in the model are not carefully tuned yet, the agents in the model are still able to run away from the fire coming from the left hand side and escape towards on the right hand side.

![](https://github.com/ZT220501/Agent-Based-Fire-Evacuation/blob/main/Results/simulation_without_house_collapse.gif)

The simulation above is the simulation of the heterogeneous model without house, exclusively using the Morse potential. In this simulation, cars could run over people, and cars could also adhere to each other and never separate apart afterwards; such phenomenon are not realistic enough, and shall be resolved in the modified model.

![](https://github.com/ZT220501/Agent-Based-Fire-Evacuation/blob/main/Results/simulation_without_house.gif)

The simulation above is the simulation of the heterogeneous model without house, using the Morse potential when agents are away from a car and use Lennard-Jones term for repulsion when agents are extremely close to a car. In this case, a person will be repulsed away from cars when it is extremely close to a car so that cars can not crush over people. Moreover, cars do not adhere to each other in this simulation.

![](https://github.com/ZT220501/Agent-Based-Fire-Evacuation/blob/main/Results/simulation_fixed.gif)

The simulation above is the simulation of the heterogeneous model with house. In the simulation, people could get out of the buildings and get around the buildings without passing through the walls. As in the previous case, cars would not crush over people and cars do not adhere to each other in this simulation.

---
title: Similarity Learning Applications in RL
created: '2021-07-26T13:46:43.449Z'
modified: '2021-07-26T13:46:49.463Z'
---

# Similarity Learning Applications in RL

## Similarity Learning
### Metrics

### Ranking
- Transfer learning for reusing option (subtask) policies
- Use distance in embedded space as the similarity metric

Consider an MDP $\mathcal{M}=\langle \mathcal{S},\mathcal{A},P,R,\mathcal{E}\rangle$ with:
- $\mathcal{S}$ state space
- $\mathcal{A}$ action space
- $P$ transition model (plant)
- $R$ reward model
- $\mathcal{E}$ exit (terminal) state set

For hierarchical RL we divide the MDP into subMDPs. Consider a partition of $\mathcal{S}$ into disjoint subsets $\mathcal{S}_i$. Then we have an induced subMDP $\mathcal{M}_i=\langle \mathcal{S}_i \cup \mathcal{E}_i,\mathcal{A},P_i,R_i,\mathcal{E}_i\rangle$.

Equivalent subMDPs:
- there exists a bijection $f:\mathcal{S}_i \cup \mathcal{E}_i \rightarrow \mathcal{S}_j \cup \mathcal{E}_j$ such that, through $f$, the subMDPs have equivalent transition probabilities and rewards at internal states

The number $k$ of equivalence classes for subMDPs is crucial for efficiency. 


### RL transfer based on subgoal similarity (Wang, et. al.)
Consider an option in an MDP $o$ defined as a triplet $\langle I,\pi,\beta\rangle$ consisting of the initialization set, sub-policy, and termination condition.

**Goal**: Compute distance (similarity) between two options $o=\langle I,\pi,\beta\rangle$ and $o'=\langle I',\pi',\beta'\rangle$.

For transfer learing, define the pseudometric between states as

$$d_\theta(s,s') = \sum\limits_{a\in A}\rho_\theta(\text{Pr}\{a|s\},\text{Pr}\{a|s'\})$$

where $\rho_\theta$ is a thresholding operator:

$$
\rho_\theta(x,y) = 
\begin{cases}
  0 & |x-y|<\theta \\
  1 & \text{otherwise}
\end{cases}
$$

Given: an injective mapping $f: I \rightarrow I'$ mapping the most similar states between the initialization sets. Now we define the distance between two options:

$$D_{\theta}(o,o')=C_1 \sum\limits_{s' \in I'}d_\theta(f(s'),s')+C_2(|I|-|I'|)$$

### Preference Search
- Can we build a sort of heat map or contour map representing the preference landscape?
- Imagine mapping the state space to distances in the embedded space from a user preference point
![screenshot](../attachments/color_map.png)


## Options discovery
### Existing Methods
- State frequency (bottleneck states) method
  - Construct $\mathcal{M}$ with randomized subgoals (states) and train with Q-learning or other RL algorithm
  - Use most frequenctly visited states as subgoals
    - Either globally or locally most-visited
- Demonstration learning from an expert
  - Hidden Markov model
  - Expectation maximization algorithm
  - Baum-Welch algorithm
- Unsupervised learning of skills




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section{Decoherence in QWs}\label{mathematical_framework}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
In this scenario, a phase retarder is applied to the coin degree of freedom of the quantum walker for sometime steps. Initially, the QW evolves for some time steps without decoherence. Afterwards, a phase retarder is applied to the coin degree of freedom. The phase retarder is given by

\begin{equation}
    \mathcal{R}=
\left( {\begin{array}{cc}
e^{i \gamma} & 0 \\
0 & e^{-i \gamma} \\
\end{array}}\right)
\end{equation}
where $\gamma \in [0, 2 \pi]$ is a random number. The evolution of the QW is governed by 
\begin{equation}
    \begin{cases}
    \mathcal{S}\mathcal{C}|\bm{\psi}_t\rangle & \text{if } 0< t \leq step1 \\
\mathcal{S}\mathcal{R}\mathcal{S}|\bm{\psi}_t\rangle & \text{if } step1 <t \leq step2
\end{cases}
\end{equation}
Note that, $total\ time = step1+ step2$.

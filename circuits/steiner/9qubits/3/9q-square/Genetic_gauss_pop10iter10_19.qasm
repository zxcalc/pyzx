// Initial wiring: [0 2 1 8 4 5 6 7 3]
// Resulting wiring: [0 2 1 8 4 5 6 7 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[3], q[4];
cx q[1], q[4];

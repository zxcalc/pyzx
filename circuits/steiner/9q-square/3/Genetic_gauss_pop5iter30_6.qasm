// Initial wiring: [0 1 2 7 8 5 6 4 3]
// Resulting wiring: [0 1 2 7 8 5 6 4 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[4], q[1];
cx q[7], q[8];

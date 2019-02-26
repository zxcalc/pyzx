// Initial wiring: [0 4 2 3 7 1 6 8 5]
// Resulting wiring: [0 5 2 3 7 1 6 8 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[0], q[1];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[0], q[5];

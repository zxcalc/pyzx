// Initial wiring: [0 4 2 3 1 5 7 8 6]
// Resulting wiring: [0 4 2 3 1 6 7 8 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[6];
cx q[5], q[6];
cx q[5], q[6];
cx q[0], q[5];

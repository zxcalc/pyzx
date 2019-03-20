// Initial wiring: [0 1 2 3 7 5 6 8 4]
// Resulting wiring: [0 1 2 3 7 4 6 8 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[0], q[5];
cx q[6], q[5];

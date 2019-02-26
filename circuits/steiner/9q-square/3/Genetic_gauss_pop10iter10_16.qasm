// Initial wiring: [0 1 2 8 4 5 7 6 3]
// Resulting wiring: [0 1 2 8 4 6 7 5 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[4];
cx q[5], q[6];
cx q[5], q[6];
cx q[5], q[6];
cx q[0], q[5];
cx q[2], q[3];

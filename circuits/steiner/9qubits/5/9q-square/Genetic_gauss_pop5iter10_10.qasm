// Initial wiring: [0 1 2 8 4 6 5 3 7]
// Resulting wiring: [0 1 2 8 5 6 4 3 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[1];
cx q[0], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[7], q[4];
cx q[1], q[4];
cx q[2], q[3];

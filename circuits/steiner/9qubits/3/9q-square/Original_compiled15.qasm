// Initial wiring: [0 1 2 3 4 5 6 8 7]
// Resulting wiring: [0 1 3 2 5 4 6 8 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[3];
cx q[2], q[3];
cx q[2], q[3];
cx q[2], q[3];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[1], q[2];
cx q[7], q[4];

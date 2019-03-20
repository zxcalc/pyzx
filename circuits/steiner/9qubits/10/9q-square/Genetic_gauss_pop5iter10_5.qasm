// Initial wiring: [0 1 2 3 4 6 5 8 7]
// Resulting wiring: [6 1 2 3 4 7 0 8 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[1], q[0];
cx q[0], q[5];
cx q[0], q[5];
cx q[0], q[5];
cx q[4], q[5];
cx q[6], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[1], q[0];
cx q[5], q[6];
cx q[5], q[6];
cx q[0], q[5];
cx q[1], q[2];

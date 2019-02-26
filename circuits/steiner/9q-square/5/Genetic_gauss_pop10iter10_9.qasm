// Initial wiring: [0 1 2 3 4 5 6 8 7]
// Resulting wiring: [7 1 2 3 4 0 5 8 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[0], q[5];
cx q[0], q[5];
cx q[0], q[5];
cx q[5], q[6];
cx q[5], q[6];
cx q[5], q[6];
cx q[7], q[6];
cx q[7], q[6];
cx q[2], q[3];
cx q[7], q[8];

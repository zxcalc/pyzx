// Initial wiring: [2, 8, 0, 4, 7, 1, 6, 3, 5]
// Resulting wiring: [2, 8, 0, 4, 7, 1, 6, 3, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[6], q[7];
cx q[5], q[6];
cx q[7], q[6];
cx q[8], q[7];
cx q[6], q[5];
cx q[8], q[3];
cx q[5], q[0];
cx q[6], q[5];
cx q[7], q[6];
cx q[8], q[7];
cx q[5], q[6];

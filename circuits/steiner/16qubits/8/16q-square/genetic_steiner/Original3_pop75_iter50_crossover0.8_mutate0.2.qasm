// Initial wiring: [13, 0, 6, 12, 15, 9, 11, 10, 8, 4, 3, 14, 1, 5, 2, 7]
// Resulting wiring: [13, 0, 6, 12, 15, 9, 11, 10, 8, 4, 3, 14, 1, 5, 2, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[1];
cx q[9], q[6];
cx q[6], q[1];
cx q[1], q[0];
cx q[9], q[6];
cx q[10], q[9];
cx q[14], q[13];
cx q[14], q[9];
cx q[9], q[14];
cx q[8], q[9];
cx q[6], q[9];
cx q[9], q[14];
cx q[14], q[9];
cx q[3], q[4];

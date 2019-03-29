// Initial wiring: [13, 1, 15, 8, 6, 10, 4, 7, 2, 3, 5, 0, 14, 11, 12, 9]
// Resulting wiring: [13, 1, 15, 8, 6, 10, 4, 7, 2, 3, 5, 0, 14, 11, 12, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[2], q[1];
cx q[6], q[5];
cx q[8], q[7];
cx q[10], q[5];
cx q[14], q[9];
cx q[15], q[14];
cx q[14], q[13];
cx q[14], q[9];
cx q[11], q[12];
cx q[10], q[13];
cx q[6], q[9];
cx q[9], q[14];
cx q[5], q[10];
cx q[4], q[5];
cx q[5], q[10];
cx q[0], q[1];

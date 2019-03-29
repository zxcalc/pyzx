// Initial wiring: [12, 13, 0, 19, 4, 17, 5, 8, 6, 11, 15, 9, 1, 18, 10, 3, 14, 2, 16, 7]
// Resulting wiring: [12, 13, 0, 19, 4, 17, 5, 8, 6, 11, 15, 9, 1, 18, 10, 3, 14, 2, 16, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[9], q[0];
cx q[13], q[7];
cx q[15], q[16];
cx q[14], q[16];
cx q[10], q[11];
cx q[6], q[13];
cx q[2], q[3];

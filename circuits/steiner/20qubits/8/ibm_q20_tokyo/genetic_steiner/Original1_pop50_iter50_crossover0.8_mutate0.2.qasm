// Initial wiring: [11, 18, 4, 3, 7, 1, 10, 13, 2, 19, 15, 5, 9, 14, 12, 17, 6, 16, 8, 0]
// Resulting wiring: [11, 18, 4, 3, 7, 1, 10, 13, 2, 19, 15, 5, 9, 14, 12, 17, 6, 16, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[7], q[2];
cx q[8], q[2];
cx q[13], q[12];
cx q[14], q[13];
cx q[13], q[12];
cx q[18], q[12];
cx q[18], q[11];
cx q[14], q[16];

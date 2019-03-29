// Initial wiring: [2, 11, 0, 14, 10, 15, 6, 3, 1, 9, 16, 18, 17, 8, 13, 7, 19, 5, 12, 4]
// Resulting wiring: [2, 11, 0, 14, 10, 15, 6, 3, 1, 9, 16, 18, 17, 8, 13, 7, 19, 5, 12, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[6];
cx q[6], q[3];
cx q[15], q[14];
cx q[17], q[12];
cx q[9], q[10];
cx q[8], q[11];

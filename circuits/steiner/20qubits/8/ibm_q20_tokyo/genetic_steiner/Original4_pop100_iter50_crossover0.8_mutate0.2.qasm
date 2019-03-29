// Initial wiring: [14, 9, 15, 3, 19, 1, 10, 8, 2, 16, 17, 11, 7, 12, 18, 6, 13, 0, 4, 5]
// Resulting wiring: [14, 9, 15, 3, 19, 1, 10, 8, 2, 16, 17, 11, 7, 12, 18, 6, 13, 0, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[5], q[3];
cx q[8], q[7];
cx q[8], q[2];
cx q[11], q[10];
cx q[14], q[13];
cx q[17], q[16];
cx q[11], q[12];

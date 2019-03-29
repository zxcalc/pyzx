// Initial wiring: [11, 13, 15, 16, 9, 7, 12, 1, 4, 8, 5, 0, 19, 2, 10, 3, 17, 14, 18, 6]
// Resulting wiring: [11, 13, 15, 16, 9, 7, 12, 1, 4, 8, 5, 0, 19, 2, 10, 3, 17, 14, 18, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[4], q[3];
cx q[6], q[4];
cx q[11], q[10];
cx q[12], q[7];
cx q[14], q[5];
cx q[15], q[13];
cx q[17], q[12];

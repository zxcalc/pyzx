// Initial wiring: [3, 15, 7, 18, 2, 8, 12, 1, 14, 17, 16, 0, 11, 6, 4, 10, 13, 5, 9, 19]
// Resulting wiring: [3, 15, 7, 18, 2, 8, 12, 1, 14, 17, 16, 0, 11, 6, 4, 10, 13, 5, 9, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[12];
cx q[15], q[2];
cx q[19], q[7];
cx q[18], q[10];
cx q[8], q[19];
cx q[6], q[18];
cx q[11], q[17];
cx q[0], q[4];

// Initial wiring: [1, 8, 19, 11, 16, 10, 12, 3, 7, 6, 9, 0, 17, 18, 15, 14, 13, 5, 4, 2]
// Resulting wiring: [1, 8, 19, 11, 16, 10, 12, 3, 7, 6, 9, 0, 17, 18, 15, 14, 13, 5, 4, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[16], q[15];
cx q[16], q[14];
cx q[18], q[17];
cx q[19], q[10];
cx q[18], q[19];
cx q[10], q[11];
cx q[3], q[4];

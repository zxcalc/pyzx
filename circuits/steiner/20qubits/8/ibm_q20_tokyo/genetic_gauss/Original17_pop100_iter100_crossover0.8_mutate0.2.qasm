// Initial wiring: [11, 3, 14, 9, 0, 13, 6, 18, 10, 8, 7, 15, 5, 16, 2, 19, 12, 4, 1, 17]
// Resulting wiring: [11, 3, 14, 9, 0, 13, 6, 18, 10, 8, 7, 15, 5, 16, 2, 19, 12, 4, 1, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[6];
cx q[6], q[2];
cx q[10], q[5];
cx q[18], q[7];
cx q[12], q[19];
cx q[3], q[13];

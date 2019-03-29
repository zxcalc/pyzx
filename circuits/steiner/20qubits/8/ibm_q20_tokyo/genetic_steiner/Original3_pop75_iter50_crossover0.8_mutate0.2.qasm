// Initial wiring: [11, 12, 9, 16, 3, 8, 2, 14, 5, 13, 0, 1, 19, 6, 15, 18, 4, 7, 10, 17]
// Resulting wiring: [11, 12, 9, 16, 3, 8, 2, 14, 5, 13, 0, 1, 19, 6, 15, 18, 4, 7, 10, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[0];
cx q[10], q[8];
cx q[12], q[11];
cx q[18], q[17];
cx q[7], q[12];
cx q[4], q[6];
cx q[2], q[3];
cx q[1], q[2];

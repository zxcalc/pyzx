// Initial wiring: [7, 13, 6, 18, 19, 15, 9, 11, 16, 17, 8, 12, 0, 10, 14, 1, 5, 4, 3, 2]
// Resulting wiring: [7, 13, 6, 18, 19, 15, 9, 11, 16, 17, 8, 12, 0, 10, 14, 1, 5, 4, 3, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[4], q[3];
cx q[8], q[2];
cx q[10], q[9];
cx q[12], q[11];
cx q[16], q[15];
cx q[17], q[12];
cx q[12], q[7];
cx q[17], q[16];
cx q[17], q[12];
cx q[18], q[11];
cx q[18], q[19];
cx q[11], q[17];
cx q[5], q[6];
cx q[6], q[7];

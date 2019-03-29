// Initial wiring: [2, 14, 18, 16, 13, 19, 3, 7, 12, 6, 10, 9, 15, 0, 4, 11, 17, 8, 5, 1]
// Resulting wiring: [2, 14, 18, 16, 13, 19, 3, 7, 12, 6, 10, 9, 15, 0, 4, 11, 17, 8, 5, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[0];
cx q[5], q[1];
cx q[16], q[15];
cx q[12], q[5];
cx q[12], q[10];
cx q[18], q[8];
cx q[18], q[11];
cx q[16], q[17];
cx q[10], q[11];
cx q[8], q[19];
cx q[6], q[17];
cx q[11], q[15];
cx q[8], q[13];
cx q[2], q[18];
cx q[3], q[17];
cx q[4], q[11];

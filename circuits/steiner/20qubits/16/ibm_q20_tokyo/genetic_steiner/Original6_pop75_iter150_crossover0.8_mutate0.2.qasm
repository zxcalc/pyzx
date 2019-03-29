// Initial wiring: [16, 6, 2, 3, 13, 15, 12, 0, 18, 19, 8, 1, 4, 11, 9, 10, 14, 5, 7, 17]
// Resulting wiring: [16, 6, 2, 3, 13, 15, 12, 0, 18, 19, 8, 1, 4, 11, 9, 10, 14, 5, 7, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[7], q[6];
cx q[8], q[1];
cx q[9], q[8];
cx q[17], q[11];
cx q[12], q[17];
cx q[12], q[13];
cx q[10], q[19];
cx q[7], q[13];
cx q[5], q[14];
cx q[14], q[13];
cx q[3], q[6];
cx q[6], q[12];
cx q[0], q[1];

// Initial wiring: [12, 17, 6, 16, 13, 10, 19, 9, 2, 18, 4, 14, 7, 8, 11, 15, 5, 0, 1, 3]
// Resulting wiring: [12, 17, 6, 16, 13, 10, 19, 9, 2, 18, 4, 14, 7, 8, 11, 15, 5, 0, 1, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[3], q[2];
cx q[2], q[1];
cx q[5], q[3];
cx q[3], q[2];
cx q[8], q[1];
cx q[10], q[9];
cx q[14], q[13];
cx q[12], q[17];
cx q[11], q[18];
cx q[11], q[12];
cx q[7], q[12];
cx q[7], q[8];
cx q[2], q[3];
cx q[3], q[6];
cx q[6], q[12];
cx q[12], q[17];
cx q[17], q[12];
cx q[0], q[9];
cx q[0], q[1];

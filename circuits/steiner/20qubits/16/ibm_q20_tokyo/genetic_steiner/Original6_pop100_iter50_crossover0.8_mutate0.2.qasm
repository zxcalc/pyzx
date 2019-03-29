// Initial wiring: [2, 12, 0, 4, 14, 9, 11, 3, 19, 7, 13, 18, 5, 17, 15, 10, 8, 1, 6, 16]
// Resulting wiring: [2, 12, 0, 4, 14, 9, 11, 3, 19, 7, 13, 18, 5, 17, 15, 10, 8, 1, 6, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[1], q[0];
cx q[3], q[2];
cx q[7], q[1];
cx q[1], q[0];
cx q[14], q[5];
cx q[16], q[13];
cx q[19], q[18];
cx q[12], q[17];
cx q[11], q[18];
cx q[8], q[11];
cx q[5], q[6];
cx q[6], q[12];
cx q[3], q[6];
cx q[6], q[12];
cx q[2], q[3];
cx q[3], q[6];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[2];

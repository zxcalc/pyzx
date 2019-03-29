// Initial wiring: [8, 16, 12, 9, 19, 17, 7, 0, 13, 3, 10, 6, 4, 18, 14, 15, 11, 5, 2, 1]
// Resulting wiring: [8, 16, 12, 9, 19, 17, 7, 0, 13, 3, 10, 6, 4, 18, 14, 15, 11, 5, 2, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[2], q[1];
cx q[4], q[3];
cx q[5], q[4];
cx q[9], q[8];
cx q[8], q[2];
cx q[9], q[0];
cx q[9], q[8];
cx q[14], q[13];
cx q[17], q[11];
cx q[11], q[18];
cx q[10], q[11];
cx q[11], q[12];
cx q[7], q[8];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[8];

// Initial wiring: [5, 15, 19, 7, 3, 9, 0, 11, 17, 18, 10, 14, 1, 6, 8, 2, 13, 12, 4, 16]
// Resulting wiring: [5, 15, 19, 7, 3, 9, 0, 11, 17, 18, 10, 14, 1, 6, 8, 2, 13, 12, 4, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[7], q[6];
cx q[7], q[2];
cx q[7], q[1];
cx q[8], q[2];
cx q[10], q[8];
cx q[8], q[2];
cx q[14], q[5];
cx q[16], q[13];
cx q[17], q[12];
cx q[12], q[7];
cx q[7], q[2];
cx q[7], q[1];
cx q[18], q[11];
cx q[11], q[9];
cx q[17], q[18];
cx q[14], q[15];
cx q[9], q[10];
cx q[3], q[6];

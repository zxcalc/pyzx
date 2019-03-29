// Initial wiring: [3, 2, 1, 15, 16, 7, 11, 8, 9, 4, 18, 0, 14, 6, 10, 17, 19, 5, 13, 12]
// Resulting wiring: [3, 2, 1, 15, 16, 7, 11, 8, 9, 4, 18, 0, 14, 6, 10, 17, 19, 5, 13, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[2], q[1];
cx q[4], q[3];
cx q[6], q[5];
cx q[8], q[7];
cx q[8], q[2];
cx q[8], q[1];
cx q[9], q[0];
cx q[10], q[9];
cx q[12], q[11];
cx q[13], q[7];
cx q[7], q[2];
cx q[7], q[1];
cx q[13], q[7];
cx q[14], q[13];
cx q[16], q[15];
cx q[16], q[13];
cx q[14], q[15];
cx q[8], q[10];
cx q[4], q[5];

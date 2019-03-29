// Initial wiring: [11, 12, 0, 15, 10, 7, 8, 9, 6, 5, 2, 3, 14, 4, 13, 1]
// Resulting wiring: [11, 12, 0, 15, 10, 7, 8, 9, 6, 5, 2, 3, 14, 4, 13, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[3], q[2];
cx q[8], q[7];
cx q[11], q[10];
cx q[12], q[11];
cx q[12], q[3];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[10];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[3];
cx q[14], q[13];
cx q[11], q[12];
cx q[9], q[10];
cx q[10], q[11];
cx q[2], q[3];
cx q[1], q[14];
cx q[0], q[1];
cx q[1], q[2];
cx q[0], q[15];
cx q[2], q[3];

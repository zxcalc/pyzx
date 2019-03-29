// Initial wiring: [13, 11, 10, 1, 9, 14, 3, 7, 2, 8, 4, 15, 12, 6, 5, 0]
// Resulting wiring: [13, 11, 10, 1, 9, 14, 3, 7, 2, 8, 4, 15, 12, 6, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[3], q[2];
cx q[2], q[1];
cx q[9], q[6];
cx q[10], q[9];
cx q[9], q[6];
cx q[10], q[5];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[9], q[6];
cx q[11], q[10];
cx q[12], q[11];
cx q[14], q[15];
cx q[11], q[12];
cx q[12], q[13];
cx q[10], q[11];
cx q[11], q[12];
cx q[6], q[7];
cx q[4], q[5];
cx q[1], q[2];
cx q[2], q[3];

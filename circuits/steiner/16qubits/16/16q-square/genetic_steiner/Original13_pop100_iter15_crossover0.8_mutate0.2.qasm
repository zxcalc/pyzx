// Initial wiring: [13, 11, 2, 7, 9, 15, 1, 10, 0, 12, 14, 3, 4, 8, 6, 5]
// Resulting wiring: [13, 11, 2, 7, 9, 15, 1, 10, 0, 12, 14, 3, 4, 8, 6, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[4], q[3];
cx q[5], q[4];
cx q[4], q[3];
cx q[6], q[1];
cx q[8], q[7];
cx q[10], q[5];
cx q[5], q[4];
cx q[4], q[3];
cx q[10], q[5];
cx q[11], q[4];
cx q[12], q[11];
cx q[11], q[4];
cx q[4], q[3];
cx q[11], q[4];
cx q[14], q[15];
cx q[12], q[13];
cx q[11], q[12];
cx q[12], q[13];
cx q[12], q[11];
cx q[9], q[10];
cx q[4], q[11];
cx q[11], q[12];
cx q[4], q[5];

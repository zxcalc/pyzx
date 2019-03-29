// Initial wiring: [9, 15, 3, 10, 4, 6, 7, 8, 12, 5, 11, 14, 13, 2, 0, 1]
// Resulting wiring: [9, 15, 3, 10, 4, 6, 7, 8, 12, 5, 11, 14, 13, 2, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[10], q[9];
cx q[10], q[5];
cx q[12], q[11];
cx q[15], q[14];
cx q[14], q[15];
cx q[12], q[13];
cx q[13], q[12];
cx q[10], q[13];
cx q[2], q[5];
cx q[2], q[3];
cx q[1], q[6];
cx q[6], q[7];
cx q[0], q[7];

// Initial wiring: [7, 2, 5, 8, 10, 1, 3, 4, 9, 14, 11, 15, 0, 12, 13, 6]
// Resulting wiring: [7, 2, 5, 8, 10, 1, 3, 4, 9, 14, 11, 15, 0, 12, 13, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[6], q[1];
cx q[7], q[6];
cx q[6], q[1];
cx q[10], q[5];
cx q[13], q[12];
cx q[12], q[11];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[11];
cx q[14], q[9];
cx q[14], q[13];
cx q[15], q[8];
cx q[13], q[14];
cx q[10], q[13];
cx q[10], q[11];
cx q[6], q[9];
cx q[4], q[11];
cx q[11], q[12];
cx q[1], q[6];

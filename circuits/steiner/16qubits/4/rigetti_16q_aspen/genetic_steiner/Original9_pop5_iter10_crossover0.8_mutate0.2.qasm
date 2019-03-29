// Initial wiring: [1, 0, 3, 15, 5, 14, 10, 13, 9, 4, 8, 6, 2, 7, 11, 12]
// Resulting wiring: [1, 0, 3, 15, 5, 14, 10, 13, 9, 4, 8, 6, 2, 7, 11, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[12];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[12], q[11];
cx q[15], q[14];
cx q[14], q[13];
cx q[15], q[14];
cx q[10], q[11];
cx q[9], q[10];
cx q[8], q[9];
cx q[7], q[8];
cx q[8], q[9];
cx q[9], q[10];
cx q[10], q[11];
cx q[9], q[8];
cx q[10], q[9];
cx q[11], q[10];

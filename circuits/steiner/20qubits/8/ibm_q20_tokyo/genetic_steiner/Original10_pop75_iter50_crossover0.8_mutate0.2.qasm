// Initial wiring: [3, 14, 15, 1, 18, 10, 17, 13, 8, 7, 6, 9, 2, 16, 12, 11, 5, 4, 0, 19]
// Resulting wiring: [3, 14, 15, 1, 18, 10, 17, 13, 8, 7, 6, 9, 2, 16, 12, 11, 5, 4, 0, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[7], q[1];
cx q[12], q[11];
cx q[14], q[13];
cx q[15], q[13];
cx q[17], q[16];
cx q[17], q[12];
cx q[11], q[18];

// Initial wiring: [17, 7, 13, 5, 14, 6, 1, 4, 9, 19, 8, 10, 11, 16, 12, 18, 2, 15, 0, 3]
// Resulting wiring: [17, 7, 13, 5, 14, 6, 1, 4, 9, 19, 8, 10, 11, 16, 12, 18, 2, 15, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[6], q[5];
cx q[12], q[7];
cx q[14], q[13];
cx q[17], q[12];
cx q[12], q[6];
cx q[8], q[9];
cx q[6], q[7];

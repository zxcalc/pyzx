// Initial wiring: [19, 17, 15, 6, 14, 1, 12, 5, 13, 3, 16, 4, 8, 9, 0, 11, 18, 7, 2, 10]
// Resulting wiring: [19, 17, 15, 6, 14, 1, 12, 5, 13, 3, 16, 4, 8, 9, 0, 11, 18, 7, 2, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[6], q[3];
cx q[12], q[7];
cx q[18], q[11];
cx q[12], q[13];
cx q[9], q[11];
cx q[8], q[11];
cx q[6], q[13];

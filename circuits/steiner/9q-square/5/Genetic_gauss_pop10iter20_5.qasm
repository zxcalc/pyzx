// Initial wiring: [2 0 1 3 4 5 7 6 8]
// Resulting wiring: [2 0 4 8 1 5 7 6 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[3];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[2];
cx q[5], q[4];
cx q[1], q[4];
cx q[1], q[4];
cx q[1], q[4];
cx q[3], q[4];
cx q[4], q[7];

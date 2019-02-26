// Initial wiring: [0 4 2 3 1 5 6 7 8]
// Resulting wiring: [0 4 1 8 2 5 6 7 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[3];
cx q[8], q[3];
cx q[4], q[3];
cx q[3], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[3], q[4];
cx q[4], q[1];

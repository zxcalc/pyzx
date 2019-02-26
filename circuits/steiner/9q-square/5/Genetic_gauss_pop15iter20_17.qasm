// Initial wiring: [5 1 2 8 4 0 6 7 3]
// Resulting wiring: [5 2 1 8 4 0 6 7 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[3], q[2];
cx q[1], q[4];
cx q[1], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[1], q[0];

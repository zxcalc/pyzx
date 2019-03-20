// Initial wiring: [5 1 2 3 7 0 8 6 4]
// Resulting wiring: [5 1 2 4 7 0 8 6 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[3];
cx q[4], q[3];
cx q[5], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[5], q[4];

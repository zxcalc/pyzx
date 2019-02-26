// Initial wiring: [0 1 2 4 3 5 7 6 8]
// Resulting wiring: [0 1 2 4 3 5 7 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[2], q[3];
cx q[8], q[7];
